class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1089.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1089.0/snyk-macos"
    sha256 "d555f87a641d778d94fc55193480a73021c0ecedf64c31ed886be2500926ddc8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1089.0/snyk-linux"
    sha256 "277ac8ac91e4752a25f6eed4b75ce94ea3dd9643e5b39ce9c95c08d9e15ce881"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
