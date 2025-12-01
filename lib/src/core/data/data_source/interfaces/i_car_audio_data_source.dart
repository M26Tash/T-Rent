abstract interface class ICarAudioDataSource {
  Future<void> playRev({
    required String revAsset,
  });

  Future<void> stopRev();
}
