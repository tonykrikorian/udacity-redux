//Code Library
function createStore(reducer) {
  let state;
  let listeners = [];

  const getState = () => state;

  const subscribe = listener => {
    listeners.push(listener);
    return () => {
      listeners = listeners.filter(l => l !== listener);
    };
  };

  const dispatch = action => {
    state = reducer(state, action);
    listeners.forEach(listener => listener());
  };

  return {
    getState,
    subscribe,
    dispatch
  };
}

//App Code
function todos(state = [], action) {
  if (action.type === "ADD_TODO") {
    return state.concat([action.todo]);
  }

  return state;
}

const store = createStore(todos);
store.subscribe(() => console.log("This is the new state", store.getState()));
store.dispatch({
  type: "ADD_TODO",
  todo: {
    id: 0,
    name: "Learn redux",
    complete: false
  }
});
