class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1212.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1212.0/snyk-macos"
    sha256 "47c512abfce98dfe5aa9a53388f14e7d3f3a25a47e60a5b10c30429f6b462ab0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1212.0/snyk-linux"
    sha256 "782aa91cc398a53de52cc6348364cf3d1e27fa6bf6a4a7327999f23400da1896"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
