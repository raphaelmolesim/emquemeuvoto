var MyWindow = function() {
  try {
    return Window;
  } catch (err) {
    return window;
  }
};

