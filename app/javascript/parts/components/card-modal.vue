<template>
  <div class="modal" :class="{ 'is-active': value }">
    <div class="modal-background"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">{{ card.name }}</p>
        <button class="delete" aria-label="close" @click="toggle"></button>
      </header>
      <section class="modal-card-body">
        <p>{{ card.description }}</p>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  props: ["value", "card"],
  methods: {
    toggle: function() {
      this.$emit("input", !this.value);
    },
  },
};
</script>

<style>
.modal-card-body {
  line-height: 100px;
}
</style>
