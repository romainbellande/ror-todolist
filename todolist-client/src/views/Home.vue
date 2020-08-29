<template>
  <div class="card-container">
    <v-board-card
      v-for="board in $store.state.boards.items"
      :key="board.id"
      :link="`/boards/${board.id}`"
      >{{ board.title }}</v-board-card
    >
    <v-board-card create>Create a board</v-board-card>
  </div>
</template>

<script>
import store from "../store";
import VBoardCard from "../components/VBoardCard";

export default {
  data() {
    console.log("this.$store", this.$store);
    return store;
  },
  components: {
    VBoardCard
  }
};
</script>

<style lang="scss" scoped>
.card-container {
  display: flex;
}
</style>
