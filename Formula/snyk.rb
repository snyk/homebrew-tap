class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.840.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.840.0/snyk-macos"
    sha256 "817fffc686afac3738d60071d780c6c9cb62433a5abf6df8467876dd841cdcb1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.840.0/snyk-linux"
    sha256 "4b4f2b17af67f5a5e29175854b3d4b0f6fd5abe5742ab5e9cc377a22e20ac303"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
