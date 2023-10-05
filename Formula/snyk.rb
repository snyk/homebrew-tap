class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1230.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1230.0/snyk-macos"
    sha256 "cac4bf1113c624fac4de527084a806c9d43c1470f8bdedc95180007e70f5a2cb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1230.0/snyk-linux"
    sha256 "f63ecd7b5b809e6bb8c249e9f8724eba37c9c5a48732bd30cf62db5a16eaa467"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
