class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.323.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.323.0/snyk-macos"
    sha256 "b1ca52d42f96c2632b12eda27f5cd784a14c527c4b37d23fdb63346b31ddd97c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.323.0/snyk-linux"
    sha256 "aa9e70a5c4f65ecb4b9451e50f7f887c274f2259c8818623622c2633828b3777"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
