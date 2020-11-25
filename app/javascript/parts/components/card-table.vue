<template>
  <div class="card-table">
    <p class="card-title">{{ name }}</p>
    <div class="card-list">
      <div
        v-for="(card, index) in cards"
        :key="index"
        class="card"
        @click="openCard"
      >
        <p>{{ card.name }}</p>
        <input type="checkbox" class="checkbox" :value="card.completed" />
      </div>
    </div>
    <button
      class="button is-link is-inverted is-outlined"
      style="text-color: black"
      @click="save"
    >
      New Card
    </button>
  </div>
</template>

<script>
export default {
  props: ["name", "cards"],
  methods: {
    save: function() {
      console.log("sasdasd");
    },
    openCard: function() {
      console.log("open");
    },
  },
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
