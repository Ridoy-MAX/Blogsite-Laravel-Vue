<template>
    <div class="preloader" v-if="loading">
      <!-- You can use any loading animation here -->
      <div class="spinner"></div>
      <p>Loading</p>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  
  const loading = ref(true);
  
  // Simulate loading time or replace with actual logic
  onMounted(() => {
    setTimeout(() => {
      loading.value = false; // Set this to false when loading is complete
    }, 2000); // Adjust the timeout as needed
  });
  </script>
  
  <style scoped>
  /* Preloader styles */
.preloader {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: -webkit-gradient(linear,left top,right top,from(#42da93),to(#1357e9));
    background: -o-linear-gradient(left,#42da93 0,#1357e9 100%) !important;
    background: linear-gradient(90deg,#42da93,#1357e9) !important;
    z-index: 9999;
  }
  
  .spinner {
    width: 50px;
    height: 50px;
    border: 6px solid #ccc;
    border-top-color: #3498db;
    border-radius: 50%;
    animation: spin 1s linear infinite;
  }
  
  @keyframes spin {
    to {
      transform: rotate(360deg);
    }
  }
  </style>
  