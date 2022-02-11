class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.851.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.851.0/snyk-macos"
    sha256 "7e7d72f8a5b7c6b8e9cdca0f40e8b4ea84eb4834d355dc11c3ea07d5adae1d2c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.851.0/snyk-linux"
    sha256 "0109e89e8e5d48709954d128f61f9ecc656202e45a7c80af16681f23866eba6c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
