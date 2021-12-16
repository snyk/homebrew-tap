class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.794.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.794.0/snyk-macos"
    sha256 "6122fc95898b8f7435c05db26701b0b6e4f884650baa1a9a74a16807cbd08218"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.794.0/snyk-linux"
    sha256 "3ab5503ca9412048f1bfa09e9b3d4cc71a12f13095f05e8c1befd8f901be9903"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
