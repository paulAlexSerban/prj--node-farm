# JS Coding Conventions & Best Practices

## Binding

When binding a function to add it to the `addEventListener`, remember to assign it to a variable in order to be able to keep the reference to that function and to be able to remove it.

```javascript
this.onClickFn = this.onClick.bind(this);
this.el.addEventListener("click", this.onClickFn);
```

## Comments

It is important to document the functions.
Don't worry if the comment grows to much, they can be collapsed in your IDE but they are useful to have them directly in the code.

## Using Spread operators to pass props to a component

One way of passing props in a React component is to define them in an object and, at the time of component declaration, pass them through a spread operator.

```javascript
const props = {};
props.foo = x;
props.bar = y;
const component = <Component {...props} />;
```

Clearer code, separation between the props declaration and the component one
When using a spread operator, the actual props object is not the one that's passed through the component. Rather, a copy is created which point to a different object. That helps with keeping the data predictable.

## React Hooks

Represent a new way of writing components, an alternative to class declarations.
In a nutshell, components that use react Hooks are functional components that can access state or component life cycles with the help of special React functions.
Examples of such functions are: useState (the State Hook) and useEffect (the Effect Hook).
There are four important rules that must be taken into account when using React hooks:

- Hooks should only sit at the top-level of your component
- Only call Hooks from React functional components
- Never call a Hook from a regular function
- Hooks can call other Hooks
  Breaking the latter three will trigger an error from React, while the former could be considered a pattern and as such will be described in more details in the next section.

```javascript
import React, { useState, useEffect } from "react";

function Example() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    document.title = `You clicked ${count} times`;
  });

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>Click me</button>
    </div>
  );
}
```

## Only call React hooks at the top level

- never call React hooks inside loops, conditions or nested functions

  - the reason behind it is that React expects the hook methods to be called in the same order each time a component is rendered.
  - If, for a certain render, one of the methods ends up not being called, the state elements might get mixed up.
  - When needed, loops and conditionals can be used inside the functions themselves.

> BAD EXAMPLE

```javascript
function Form() {
  const [name, setName] = useState("Mary");
  //this breaks the first rule
  if (name !== "") {
    useEffect(function persistForm() {
      localStorage.setItem("formData", name);
    });
  }

  const [surname, setSurname] = useState("Poppins");
}
```

> GOOD EXAMPLE

```javascript
function Form() {
  const [name, setName] = useState("Mary");

  //the correct alternative
  useEffect(function persistForm() {
    if (name !== "") {
      localStorage.setItem("formData", name);
    }
  });

  const [surname, setSurname] = useState("Poppins");
}
```

- Prevents potential bugs caused by the functions not being called in the same order upon component rendering

## useEffect hook

When you create a `useEffect` hook, add in the dependency array parameter all of the the render-level variables that will be used in the hook

- The dependency array is the second parameter that is passed to a useEffect hook, the first being the callback function itself.
- Whenever a component re-renders, React checks the variables present in the array and, if their value changed from the last render, the useEffect hook will run.
- In order to avoid unnecessarily running the effect function as well as not running it when a value that impacts it changes upon render, it is important for the dependency array to reflect the reality of which component-level values are getting used in the callback.

```javascript
const count = // ...
  useEffect(() => {
    const id = setInterval(() => {
      setCount(count + 1);
    }, 1000);
    return () => clearInterval(id);
  }, [count]);
```

> When not to use

- to avoid situations where explicitly stating all the dependencies would make the function run more times than desired, there is a number of techniques to reduce the number of elements in the array without omitting the ones you actually use, like utilizing a reducer or, in the case of component functions, declaring them either inside the effect or outside the component's scope

## Using Higher order Components (HOC)

- the description "higher order" has the same meaning as in the case of "higher order functions", meaning that a higher order component takes a component and returns a new one.
- the returned component is the original one with extra props.
- React libraries also make use of HoCs in order to integrate their functionalities in the application. For example, connect() in Redux is a HoC as well as the withRouter function from react-router

```javascript
const withPuppies = (Component) = {
    const puppies = ['Fifi', 'Daisy', 'Buttons'];
}
```

## Loops

- loops can become very slow if you do not do them right - one of the most common mistake is to read the length attribute of an array at every iteration
- you can avoid that by storing the length value on a different variable and

```javascript
const arr = [1, 2, 3];
const arrLength = arr.length;
for(let i = 0; i < arrLength; i++) {
  console.log(arr[i]))
}
```

## Do not use new Object()
- use `""` instead `new String()`
- use `0` instead of `new Number()`
- use `false` instead of `new Boolean()`
- use `{}` instead of `new Object()`
- use `[]` instead of `new Array()`
- use `/()/` instead of `new RegExp()`
- use `function() {}` instead of `new Function()`