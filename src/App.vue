<template>
  <div id="app">
    <PdfViewer />
    <Toast />
  </div>
</template>

<script setup lang="ts">
import PdfViewer from "./components/PdfViewer.vue";
import Toast from "./components/Toast.vue";
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  padding: 0;
  margin: 0;
  width: 100vw;
  height: 100vh;
}
</style>
