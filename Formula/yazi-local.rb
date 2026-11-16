class YaziLocal < Formula
  desc "Yazi fork with kitty graphics protocol forwarding for embedded terminals"
  homepage "https://github.com/ApexGP/yazi"
  version "26.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ApexGP/homebrew-yazi/releases/download/v26.9.1/yazi-v26.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "cc92cbe8bf64661e4e205dbb3250e517dd22f999bfe99e1b7c51d6f65ad2fb56"
    else
      url "https://github.com/ApexGP/homebrew-yazi/releases/download/v26.9.1/yazi-v26.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "f7f9ffddf726b3bb8904c213623b35a42bea7ab0e6eaf15e77712a623e788275"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ApexGP/homebrew-yazi/releases/download/v26.9.1/yazi-v26.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c338bae09c3f443eb2b034a1edf502315f02c42736c29ef1b599321289dbb383"
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
