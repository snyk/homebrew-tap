class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.367.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.367.0/snyk-macos"
    sha256 "c4cdf6d1b4a7b6ba70576aa922ae36d451c6670c8b4b55efa7abee12bbbf55c4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.367.0/snyk-linux"
    sha256 "7c6039f0130d9dc5c014a1dc2509103a6b040270334bb5cffd7f09e50839eb63"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
