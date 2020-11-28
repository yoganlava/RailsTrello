<template>
  <div class="card-table">
    <p class="card-title">{{ name }}</p>
    <div class="card-list">
      <draggable v-model="cards" @start="drag=true" @end="drag=false">
      <div
        v-for="(card, index) in cards"
        :key="index"
        class="card"
        @click="openCard(card)"
      >
        <p>{{ card.name }}</p>
        <input type="checkbox" class="checkbox" :value="card.completed" />
      </div>
      </draggable>
    </div>
    <button
      class="button is-link is-inverted is-outlined"
      style="text-color: black"
      @click="createCard"
    >
      New Card
    </button>
  </div>
</template>

<script>
import Vue from 'vue';
import draggable from 'vuedraggable';
export default {
  props: ["name", "cards"],
  methods: {
    save: function() {
      console.log("sasdasd");
    },
    createCard: function() {
      let size = Object.keys(this.cards).length;

      Vue.set(this.cards, size, {
        name: "",
        description: ""
      });
    },
    openCard: function(card) {
      console.log("open");
      console.log(this.$parent);
      console.log(this.$parent.openCard)
      this.$parent.openCard(card);
    },
  },
  components: {
    draggable
  }
};
</script>

<style lang="scss" scoped>
.card-title {
  font-weight: 600;
}

.card-table {
  background-color: #ebecf0;
  margin-left: 25px;
  width: 300px;
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0 15px 35px 0 rgba(60, 66, 87, 0.12),
    0 5px 15px 0 rgba(0, 0, 0, 0.12);
}

.card-list {
  //   padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
}

.card {
  border-radius: 3px;
  padding: 5px;
  margin-bottom: 10px;
  cursor: pointer;
  box-shadow: 0 1px 0 rgba(9, 30, 66, 0.25);
  &:hover {
    background-color: #f4f5f7;
  }
}

.is-outlined {
  border-color: #605959 !important;
  color: #605959 !important;
}
</style>
