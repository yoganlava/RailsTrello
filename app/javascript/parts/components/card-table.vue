<template>
  <div class="card-table">
    <div class="card-table-top">
      <!-- replace p tag with input tag if the p tag is clicked -->
      <p class="card-title" v-if="!nameClicked" @click="toggleCardName">
        {{ model.name }}
      </p>
      <input
        type="text"
        v-model="model.name"
        v-else
        v-on:keydown.enter="toggleTableName"
      />
      <button class="delete" aria-label="close" @click="deleteTable"></button>
    </div>
    <div class="card-list">
      <!-- make cards draggable, after being dragged around, allow for the priorities and position of the card to be updated-->
      <draggable
        :list="model.cards"
        group="cards"
        v-bind="dragOptions"
        @end="updateCardPriority"
      >
      <!-- loop through cards and create div for each one -->
        <div
          v-for="(card, index) in model.cards"
          :key="index"
          class="card"
          @click="openCard($event, card)"
        >
          <p>{{ card.name }}</p>
          <!-- calculation to calculate how many days left untile due_date -->
          <p>
            {{
              Math.ceil((new Date(card.due_date) - new Date()) / 86400000) <= 0
                ? "DUE"
                : Math.ceil((new Date(card.due_date) - new Date()) / 86400000) +
                  " days left"
            }}
          </p>
          <input type="checkbox" class="checkbox" v-model="card.completed" />
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
import Vue from "vue";
import draggable from "vuedraggable";
export default {
  props: ["model"],
  data: () => ({
    dragOptions: {
      animation: 200,
      disabled: false,
      ghostClass: "ghost",
    },
    nameClicked: false,
  }),
  methods: {
    // create card client side
    createCard() {
      let size = Object.keys(this.model.cards).length;
      Vue.set(this.model.cards, size, {
        name: "New card",
        completed: false,
        description: "Example Description",
        priority: size,
        due_date: new Date().toISOString(),
      });
    },
    // call open card function
    openCard(event, card) {
      if (event.target.className == "checkbox") return;
      this.$emit("openCard", card);
    },
    // call update card function
    updateCardPriority() {
      this.$emit("updateCard", this.model.column_index);
    },
    // call delete function
    deleteTable() {
      this.$emit("deleteTable", this.model);
    },
    // toggle input box from appearing if the name of the table has been clicked
    toggleTableName() {
      this.nameClicked = !this.nameClicked;
    },
  },
  components: {
    draggable,
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

.card-table-top {
  display: flex;
  justify-content: space-between;
}

.card-list {
  margin-top: 10px;
  margin-bottom: 10px;
}

.card {
  border-radius: 3px;
  padding: 5px;
  margin-bottom: 10px;
  cursor: pointer;
  box-shadow: 0 1px 0 rgba(9, 30, 66, 0.25);
  display: flex;
  justify-content: space-between;
  &:hover {
    background-color: #f4f5f7;
  }
}

.is-outlined {
  border-color: #605959 !important;
  color: #605959 !important;
}

.ghost {
  opacity: 0.5;
  background: #c8ebfb;
}
</style>
