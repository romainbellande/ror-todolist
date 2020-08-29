export default {
  state: () => ({
    items: [
      {
        id: "a3971c54-4456-4a4b-b1f0-148c18df9753",
        title: "My board",
        lists: [
          {
            id: "9b655793-354d-469e-90be-2a2a19f9d799",
            title: "Todo",
            todos: [
              {
                id: "2aebe3c5-2da4-4f0c-b0b0-543dc7c7c92f",
                title: "My todo"
              }
            ]
          }
        ]
      }
    ],
    selectedBoardId: null,
    selectedListId: null,
    selectedTodoId: null
  }),
  mutations: {
    setSelectedBoardId(state, id) {
      state.selectedBoardId = id;
    },
    resetSelectedBoardId(state) {
      state.selectedBoardId = null;
    },
    setSelectedListId(state, id) {
      state.selectedListId = id;
    },
    resetSelectedListId(state) {
      state.selectedListId = null;
    },
    setSelectedTodoId(state, id) {
      state.selectedTodoId = id;
    },
    resetSelectedTodoId(state) {
      state.selectedTodoId = null;
    }
  },
  actions: {},
  getters: {
    getBoard: state => id => state.items.find(item => item.id === id)
  }
};
