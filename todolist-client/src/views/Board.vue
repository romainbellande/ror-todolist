<template>
  <div class="list-container">
    <v-board-list
      v-bind:lists="board.lists"
      v-on:details="onDetails"
      @change="onListsChange"
      >TODO</v-board-list
    >
    <v-card-details
      v-if="selectedTodo"
      v-model="open"
      v-bind:todo="selectedTodo"
      v-bind:listName="selectedListName"
      @change="onCardDetailsChange"
      @close="onCardDetailsClose"
    ></v-card-details>
  </div>
</template>

<script>
import VBoardList from "../components/VBoardList";
import VCardDetails from "../components/VCardDetails";

export default {
  data() {
    return {
      open: false,
      selectedTodoIndex: null,
      selectedListindex: null,
      lists: [{ name: "TODO", items: [] }]
    };
  },
  computed: {
    board() {
      return this.$store.getters.getBoard(this.$route.params.id);
    },
    selectedTodo() {
      if (this.selectedListindex === null || this.selectedTodoIndex === null) {
        return null;
      }

      return this.lists[this.selectedListindex].items[this.selectedTodoIndex];
    },
    selectedListName() {
      return this.selectedListindex === null ||
        !this.lists[this.selectedListindex]
        ? null
        : this.lists[this.selectedListindex].name;
    }
  },
  components: {
    VBoardList,
    VCardDetails
  },
  methods: {
    onDetails(selectedListindex, selectedTodoIndex) {
      this.open = true;
      this.selectedListindex = selectedListindex;
      this.selectedTodoIndex = selectedTodoIndex;
    },
    onListsChange(lists) {
      this.lists = lists;
    },
    onCardDetailsChange(card) {
      this.lists[this.selectedListindex].items[this.selectedTodoIndex] = card;
    },
    onCardDetailsClose() {
      this.selectedListindex = null;
      this.selectedTodoIndex = null;
    }
  }
};
</script>

<style lang="scss" scoped>
.list-container {
  display: flex;
}
</style>
