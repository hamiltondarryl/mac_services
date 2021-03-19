String smallSentence(String bigSentence, int lenght, int limit) {
  if (bigSentence.length > lenght) {
    return bigSentence.substring(0, limit) + '...';
  } else {
    return bigSentence;
  }
}
