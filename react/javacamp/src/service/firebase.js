  // Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.9.3/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.9.3/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDync9al_o87hKg744E6_AX3WDVJQ1PCM0",
  authDomain: "testlogin-e3edb.firebaseapp.com",
  databaseURL: "https://testlogin-e3edb-default-rtdb.firebaseio.com",
  projectId: "testlogin-e3edb",
  storageBucket: "testlogin-e3edb.appspot.com",
  messagingSenderId: "793640808427",
  appId: "1:793640808427:web:ad4c4722e28e6822ab33ae",
  measurementId: "G-8CZSZ9B0BF"
};

  // Initialize Firebase
const firebaseApp = initializeApp(firebaseConfig);
const analytics = getAnalytics(firebaseApp);

export {firebaseApp}