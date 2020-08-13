<template>
  <div class="card-container">
    <v-board-card>My board</v-board-card>
    <v-board-card>My board 2</v-board-card>
    <v-board-card create>Create a board</v-board-card>
  </div>
</template>

<script>
import store from "../store";
import VBoardCard from '../components/VBoardCard'

export default {
  data() {
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