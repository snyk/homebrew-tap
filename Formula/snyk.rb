class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.388.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.388.0/snyk-macos"
    sha256 "2319582544e0b72e902ea020b486b2ea885b0621fed2acf3af1357d8226a31b4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.388.0/snyk-linux"
    sha256 "11a615a4b34745eb8be1262625cbdbe2a56f9970226bdb8bd279939e15a4c62f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
