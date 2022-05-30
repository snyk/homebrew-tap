class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.941.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.941.0/snyk-macos"
    sha256 "0528829835d18d988c07a72030aad148be1de82162da87720af9976082dfd35c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.941.0/snyk-linux"
    sha256 "d566d7e38c3bf5f735bba5f0257355e10ad5288ec6e1548eeb8a12684f849746"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
