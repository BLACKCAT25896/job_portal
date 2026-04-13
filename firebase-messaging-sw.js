importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCifalK_uMJydVsJqvNb7d9tDUDpWj3Qr0",
  authDomain: "mighty-ecommerce.firebaseapp.com",
  projectId: "mighty-ecommerce",
  storageBucket: "mighty-ecommerce.firebasestorage.app",
  messagingSenderId: "789305924846",
  appId: "1:789305924846:web:9f2e1784494c17179f27ff",
  measurementId: "G-BN99TFSDXJ"
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// todo Set up background message handler