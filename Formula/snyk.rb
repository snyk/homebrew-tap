class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.595.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.595.0/snyk-macos"
    sha256 "d73e277d7f12abca7b61244ddca47d678dfd87a44bd31306a1cb38033758f32d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.595.0/snyk-linux"
    sha256 "32e6b5cd35a85d7946b4de5600c87dfe04d8aee513bcb10081e946d167095bb0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
