<template>
<!-- simple page loader -->
  <div class="modal" :class="{ 'is-active': value }">
    <div class="modal-background"></div>
    <div class="spinner"></div>
  </div>
</template>

<script>
export default {
  props: ["value"],
};
</script>

<style lang="scss" scoped>
.spinner {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #00d1b2;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% {
    -webkit-transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
  }
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
