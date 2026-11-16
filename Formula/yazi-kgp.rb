class YaziKgp < Formula
  desc "Yazi fork with kitty graphics protocol forwarding for embedded terminals"
  homepage "https://github.com/ApexGP/yazi"
  version "26.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ApexGP/homebrew-yazi-kgp/releases/download/v26.9.1/yazi-v26.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "d622def6c789e972dfc8537a45744bbc65660cfe1418e6dc4dae2d8f9e270bfc"
    else
      url "https://github.com/ApexGP/homebrew-yazi-kgp/releases/download/v26.9.1/yazi-v26.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "393c556910c99ee285d699c97a196e8630ea04c1f6a2494d1fc21933d4a77983"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ApexGP/homebrew-yazi-kgp/releases/download/v26.9.1/yazi-v26.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6dce90c377df23d4ed2e2ec58a494ca02e7a8ad656ad244ebc469e6ca0646f56"
    end
  end

  def install
    bin.install "yazi", "ya"
  end

  def caveats
    <<~EOS
      Optional runtime tools are not installed automatically. Install the
      ones you need, for example: ffmpeg, 7zip, poppler, imagemagick,
      resvg, fd, ripgrep, fzf, chafa, jq.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yazi --version")
    assert_match version.to_s, shell_output("#{bin}/ya --version")
  end
end
