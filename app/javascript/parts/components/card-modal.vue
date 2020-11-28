<template>
  <div class="modal" :class="{ 'is-active': value }">
    <div class="modal-background"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <input type="text" v-model="name" class="input"/>
        <button class="delete" aria-label="close" @click="toggle"></button>
      </header>
      <section class="modal-card-body">
        <textarea class="textarea" v-model="description"></textarea>
      </section>
      <footer class="modal-card-foot">
        <button class="button is-success" @click="save">Save</button>
      </footer>
    </div>
  </div>
</template>

<script>
import Vue from "vue";
export default {
  props: ["value", "card"],
  data: () => ({
    name: "",
    description: ""
  }),
  methods: {
    toggle: function() {
      this.$emit("input", !this.value);
    },
    save: function() {
      Vue.set(this.card, "name", this.name);
      Vue.set(this.card, "description", this.description);
      this.toggle();
    }
  },
  watch:{
    value: function() {
      this.name = this.card.name;
      this.description = this.card.description;
    }
  }
};
</script>

<style scoped>
.modal-card-body {
  line-height: 100px;
}

.modal-card-foot {
  text-align: center;
}
</style>
