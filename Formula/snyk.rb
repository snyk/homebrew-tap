class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.583.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.583.0/snyk-macos"
    sha256 "e420e927ad2e43e74474a625df613a720f6fc9e8400ff5704085267dee2d6606"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.583.0/snyk-linux"
    sha256 "66e08fc2a28bd841d99486beb87a44b17a65d12210a3e337523ee1066767324a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
