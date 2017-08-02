state("bf3") {
  int loading: "bf3.exe", 0x1EE37C0;
}

isLoading {
  return current.loading != 0;
}
