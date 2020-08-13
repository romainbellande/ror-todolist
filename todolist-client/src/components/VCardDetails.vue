<template>
  <v-dialog
    v-on:input="$emit('close', false)"
    v-bind:value="open"
    max-width="290"
  >
    <v-card v-if="todo">
      <v-card-title class="title"
        ><input single-line v-bind:value="todo.title" @change="onTitleChange"
      /></v-card-title>
      <v-card-text>
        <sub>In the list: {{ listName }}</sub>
        <div class="description">Description</div>
        <textarea
          v-bind:value="todo.description"
          @change="onDescriptionChange"
          placeholder="Put a description here"
        />
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  model: {
    prop: "open",
    event: "close"
  },
  props: {
    open: {
      type: Boolean,
      required: false,
      default: false
    },
    todo: {
      type: Object,
      required: false
    },
    listName: {
      type: String,
      required: true
    }
  },
  methods: {
    onTitleChange(event) {
      this.$emit("change", {
        ...this.todo,
        title: event.target.value
      });
    },
    onDescriptionChange(event) {
      this.$emit("change", {
        ...this.todo,
        description: event.target.value
      });
    }
  }
};
</script>

<style lang="scss" scoped>
.description {
  font-weight: bold;
  margin-top: 25px;
}
</style>
