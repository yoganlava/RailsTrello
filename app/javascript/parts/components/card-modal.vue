<template>
  <div class="modal" :class="{ 'is-active': value }">
    <div class="modal-background"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <input type="text" v-model="name" class="input" style="width:30%" />
        <button class="delete" aria-label="close" @click="toggle"></button>
      </header>
      <section class="modal-card-body">
        <div class="field">
          <label class="label">Description</label>
          <textarea class="textarea" v-model="description"></textarea>
        </div>
        <div class="field">
          <label class="label">Due Date</label>
          <input type="date" v-model="due_date" />
        </div>
      </section>
      <footer class="modal-card-foot">
        <button class="button is-success" @click="save">Save</button>
        <button class="button is-success" @click="deleteCard">Delete</button>
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
    description: "",
    due_date: new Date(),
  }),
  methods: {
    // toggle card info modal
    toggle() {
      this.$emit("input", !this.value);
    },
    // save card details client side
    save() {
      Vue.set(this.card, "name", this.name);
      Vue.set(this.card, "description", this.description);
      Vue.set(this.card, "due_date", this.due_date);
      this.toggle();
    },
    // call delete card function
    deleteCard() {
      this.$emit("deleteCard", this.card);
      this.toggle();
    }
  },
  watch: {
    // create watch function that watches the value prop
    value: function() {
      this.name = this.card.name;
      this.description = this.card.description;
      this.due_date = this.card.due_date.split("T")[0];
    },
  },
};
</script>

<style scoped>
.modal-card-head {
  display: flex;
  justify-content: space-between;
}
</style>
