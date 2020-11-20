<template>
  <div class="modal" :class="{ 'is-active': value }">
    <div class="modal-background"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">Create a new board</p>
        <button class="delete" aria-label="close" @click="toggle"></button>
      </header>
      <section class="modal-card-body">
        <p>Name</p>
        <input class="input" type="text" placeholder="Name" v-model="name" />
        <p>Custom URL</p>
        <input
          class="input"
          type="text"
          placeholder="Custom Url"
          v-model="custom_url"
        />
        <div class="control">
          <label class="radio">
            <input type="radio" :v-model="this.private" :value="true" />
            Private
          </label>
          <label class="radio">
            <input type="radio" :v-model="this.private" :value="false" />
            Public
          </label>
        </div>
      </section>
      <footer class="modal-card-foot is-centered edit-footer">
        <button class="button is-success">Create</button>
        <button class="button" @click="toggle">Cancel</button>
      </footer>
    </div>
  </div>
</template>

<script>
export default {
  props: ["value"],
  data: () => ({
    name: "",
    custom_url: "",
    private: false,
  }),
  methods: {
    toggle: function() {
      this.$emit("input", !this.value);
    },
  },
};
</script>

<style></style>
