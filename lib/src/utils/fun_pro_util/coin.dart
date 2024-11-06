/// A representation of a real-world coin, but with applications of functional programming.
///
/// Please note that:
///
/// - [H] means "heads", the front side of the coin (a.k.a. obverse).
/// - [T] means "tails", the back side of the coin (a.k.a. reverse).
final class Coin<H, T> {
  final H? _h;
  final T? _t;

  /// Creates a coin with a _probability of one_ for [heads] after flipping it.
  const Coin.heads(H heads) : this._(heads);

  /// Creates a coin with a _probability of one_ for [tails] after flipping it.
  const Coin.tails(T tails) : this._(null, tails);

  const Coin._([this._h, this._t]);

  bool get _isHeads => _h != null;

  /// Invokes [onHeads] iff the coin was created by [Coin.heads]; otherwise, [onTails].
  /// Then, returns a [R].
  R flip<R>(
    R Function(H heads) onHeads,
    R Function(T tails) onTails,
  ) =>
      _isHeads ? onHeads(_h as H) : onTails(_t as T);
}
