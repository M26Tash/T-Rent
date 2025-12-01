abstract interface class ICarAudioRepository {
  Future<void> playRev({
    required String revAsset,
  });

  Future<void> stopRev();
}
