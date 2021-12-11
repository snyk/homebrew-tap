class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.789.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.789.0/snyk-macos"
    sha256 "33d46ee3a1ad52a74ce971887d9c27a174028fc3d9973eec4a6c98b0ad1f6ab3"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.789.0/snyk-linux"
    sha256 "eaba457be81bc1a24da01fc4b5bece2fb80f03ad7c58e2c8c42aa7e398e8a45d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
