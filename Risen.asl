state("Risen") {
  int loading: "Game.dll", 0xFEA66C;
}

isLoading {
  return current.loading != 0;
}
