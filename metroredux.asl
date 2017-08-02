state("metro") {
  int loading: "metro.exe", 0xCFAC30;
}

isLoading {
  return current.loading != 0;
}
