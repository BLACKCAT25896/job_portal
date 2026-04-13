import 'package:flutter/foundation.dart';
// Conditional import for web-only functionality
import 'domain_helper_stub.dart'
    if (dart.library.html) 'domain_helper_web.dart' as domain_impl;

/// Helper class to manage domain detection and configuration
/// Handles subdomain extraction, fallback domains, and environment-specific logic
class DomainHelper {
  static const String _fallbackDomain = 'starkabab.com';
  static const String _localhostDomain = 'localhost';
  static const String _vercelDomain = 'vercel.app';
  static const String _demoDomain = 'mightyschool.xyz';
  static const String _demoDomain2 = 'fuedevs.com';

  /// Cache for the current domain to avoid repeated calculations
  static String? _cachedDomain;
  
  /// Get the current domain from the browser URL
  /// Returns the domain with subdomain handling and fallback logic
  static String getCurrentDomain() {
    if (_cachedDomain != null) {
      return _cachedDomain!;
    }

    try {
      if (kIsWeb) {
        // Use platform-specific implementation
        final host = domain_impl.getCurrentHost();

        if (kDebugMode) {
          print('DomainHelper: Host: $host');
        }

        // Handle different domain scenarios
        _cachedDomain = _processDomain(host);

        if (kDebugMode) {
          print('DomainHelper: Processed domain: $_cachedDomain');
        }

        return _cachedDomain!;
      } else {
        // For non-web platforms, return fallback
        _cachedDomain = _fallbackDomain;
        return _cachedDomain!;
      }
    } catch (e) {
      if (kDebugMode) {
        print('DomainHelper: Error getting domain: $e');
      }
      _cachedDomain = _fallbackDomain;
      return _cachedDomain!;
    }
  }
  
  /// Process the raw domain and apply business logic
  static String _processDomain(String host) {
    // Handle localhost scenarios
    if (host.contains(_localhostDomain) || host.startsWith('127.0.0.1') || host.startsWith('0.0.0.0')) {
      return _fallbackDomain;
    }
    
    // Handle Vercel deployment domains
    if (host.contains(_vercelDomain) || host.contains(_demoDomain) || host.contains(_demoDomain2)) {
      return _fallbackDomain;
    }
    
    // Handle IP addresses
    if (_isIpAddress(host)) {
      return _fallbackDomain;
    }
    
    // Extract main domain from subdomain
    final domainParts = host.split('.');
    
    // If it's already a simple domain (no subdomain), return as is
    if (domainParts.length <= 2) {
      return host;
    }
    
    // For subdomains, extract the main domain
    // e.g., school.institute1.com -> institute1.com
    // e.g., college.university.edu -> university.edu
    if (domainParts.length >= 2) {
      final mainDomain = domainParts.sublist(domainParts.length - 2).join('.');
      return mainDomain;
    }
    
    return host;
  }
  
  /// Check if the given string is an IP address
  static bool _isIpAddress(String host) {
    final ipRegex = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');
    return ipRegex.hasMatch(host);
  }
  
  /// Get the subdomain from the current URL
  /// Returns null if no subdomain exists
  static String? getSubdomain() {
    try {
      if (kIsWeb) {
        final host = domain_impl.getCurrentHost();

        // Skip localhost and IP addresses
        if (host.contains(_localhostDomain) ||
            host.contains(_vercelDomain) ||
            host.contains(_demoDomain) ||
            host.contains(_demoDomain2) ||
            _isIpAddress(host)) {
          return null;
        }

        final domainParts = host.split('.');

        // If there are more than 2 parts, we have a subdomain
        if (domainParts.length > 2) {
          // Return the first part as subdomain
          return domainParts.first;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('DomainHelper: Error getting subdomain: $e');
      }
    }

    return null;
  }
  
  /// Check if the current environment is localhost
  static bool isLocalhost() {
    try {
      if (kIsWeb) {
        final host = domain_impl.getCurrentHost();

        return host.contains(_localhostDomain) ||
               host.startsWith('127.0.0.1') ||
               host.startsWith('0.0.0.0');
      }
    } catch (e) {
      if (kDebugMode) {
        print('DomainHelper: Error checking localhost: $e');
      }
    }

    return false;
  }

  /// Check if the current environment is Vercel
  static bool isVercel() {
    try {
      if (kIsWeb) {
        final host = domain_impl.getCurrentHost();

        return host.contains(_vercelDomain);
      }
    } catch (e) {
      if (kDebugMode) {
        print('DomainHelper: Error checking Vercel: $e');
      }
    }

    return false;
  }
  
  /// Clear the cached domain (useful for testing or when domain changes)
  static void clearCache() {
    _cachedDomain = null;
  }
  
  /// Get domain info for debugging
  static Map<String, dynamic> getDomainInfo() {
    return {
      'currentDomain': getCurrentDomain(),
      'subdomain': getSubdomain(),
      'isLocalhost': isLocalhost(),
      'isVercel': isVercel(),
      'fallbackDomain': _fallbackDomain,
    };
  }
}
