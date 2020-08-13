<template>
  <v-card class="list" width="272px">
    <v-card-title class="title">
      <slot></slot>
    </v-card-title>
    <div v-click-outside="onFocusOut">
      <v-card
        v-for="(card, index) in lists[0].items"
        v-bind:key="index"
        class="card"
        @click.stop="$emit('details', 0, index)"
        >{{ card.title }} <v-icon>{{ mdiPencil }}</v-icon></v-card
      >

      <v-btn
        v-if="!isEditable"
        class="button-add-card grey--text text--darken-1"
        text
        small
        @click="isEditable = true"
      >
        <v-icon>{{ mdiPlus }}</v-icon>
        Add a card
      </v-btn>
      <div v-else :set="(content = '')">
        <v-text-field solo label="Name" v-model="content"></v-text-field>
        <div>
          <v-btn @click="onCardAdded(0, content)">Add a card</v-btn>
        </div>
      </div>
    </div>
  </v-card>
</template>

<script>
import { mdiPlus, mdiPencil } from "@mdi/js";

export default {
  props: {
    lists: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      mdiPlus,
      mdiPencil,
      isEditable: false
    };
  },
  methods: {
    onFocusOut() {
      this.isEditable = false;
    },
    onCardAdded(index, title) {
      const newLists = [...this.lists];
      newLists[index].items.push({ title });
      this.$emit("change", newLists);
      this.isEditable = false;
    }
  }
};
</script>

<style lang="scss" scoped>
.list {
  margin: 0 7px;
  padding: 10px;
  .title {
    font-weight: bold;
    font-size: 14px !important;
  }
  .button-add-card {
    width: 100%;
    justify-content: start;

    .button-add-card-icon {
      &::before {
        content: "\E901";
      }
    }
  }
}

.card {
  padding: 5px 10px;
  margin-bottom: 10px;
  display: flex;
  justify-content: space-between;

  .v-icon {
    display: none;
  }

  &:hover {
    cursor: pointer;
    background-color: rgba(9, 30, 66, 0.08);

    .v-icon {
      display: block;
    }
  }
}
</style>
