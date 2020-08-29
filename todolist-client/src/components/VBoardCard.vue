<template>
  <v-dialog v-if="create" v-model="dialog" persistent max-width="290">
    <template v-slot:activator="{ on, attrs }">
      <v-card
        v-bind:class="['card', { 'card-create': create }]"
        max-width="400"
        v-on="on"
        v-bind="attrs"
      >
        <slot></slot>
      </v-card>
    </template>
    <v-card>
      <v-card-title class="headline">Create a board</v-card-title>
      <v-card-text>
        <v-text-field label="Name" single-line></v-text-field>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="green darken-1" text @click="dialog = false"
          >Cancel</v-btn
        >
        <v-btn color="green darken-1" text @click="dialog = false"
          >Create</v-btn
        >
      </v-card-actions>
    </v-card>
  </v-dialog>
  <v-card v-else class="card" max-width="400">
    <router-link :to="link">
      <slot></slot>
    </router-link>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      dialog: false
    };
  },
  props: {
    create: {
      type: Boolean,
      required: false,
      default: false
    },
    link: {
      type: String,
      required: true
    }
  }
};
</script>

<style lang="scss" scoped>
.card {
  width: 200px;
  height: 100px;
  cursor: pointer;
  margin: 0 7px;
  padding: 10px;

  a {
    text-decoration: none;
    color: inherit;
    height: 100%;
    display: block;
  }

  &.card-create {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: rgba(9, 30, 66, 0.04);
    &:hover {
      background-color: rgba(9, 30, 66, 0.08);
    }
  }
}
</style>
