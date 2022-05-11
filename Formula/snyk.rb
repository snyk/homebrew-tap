class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.925.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.925.0/snyk-macos"
    sha256 "1eb2d8e39916bbfb8372a0f13172cecdda38c9969823a72dbad5c9dbbae73777"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.925.0/snyk-linux"
    sha256 "9fbd1871e9245775f6077961655c7ef6a13d1d729b573459cbe1a960b86c4ef9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
