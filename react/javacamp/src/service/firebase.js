import { initializeApp } from "firebase/app";

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

const firebaseApp = initializeApp(firebaseConfig);

export {firebaseApp}