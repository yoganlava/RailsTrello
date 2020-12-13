<template>
  <div class="card-table">
    <div class="card-table-top">
      <p class="card-title" v-if="!nameClicked" @click="toggleCardName">
        {{ model.name }}
      </p>
      <input
        type="text"
        v-model="model.name"
        v-else
        v-on:keydown.enter="toggleCardName"
      />
      <button class="delete" aria-label="close" @click="deleteTable"></button>
    </div>
    <div class="card-list">
      <draggable
        :list="model.cards"
        group="cards"
        v-bind="dragOptions"
        @end="updateCardPriority"
      >
        <div
          v-for="(card, index) in model.cards"
          :key="index"
          class="card"
          @click="openCard($event, card)"
        >
          <p>{{ card.name }}</p>
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
    openCard(event, card) {
      if (event.target.className == "checkbox") return;
      this.$emit("openCard", card);
    },
    updateCardPriority() {
      this.$emit("updateCard", this.model.column_index);
    },
    deleteTable() {
      this.$emit("deleteTable", this.model);
    },
    toggleCardName() {
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
