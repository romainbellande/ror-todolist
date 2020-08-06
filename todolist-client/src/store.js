export default {
  debug: true,
  state: {
    message: "Hello!",
    todos: [],
  },
  addTodo(todo = {}) {
    if (this.debug) console.log("addTodo triggered with", todo);
    this.state.todos.push(todo);
  }
};
