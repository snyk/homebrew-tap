class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1013.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1013.0/snyk-macos"
    sha256 "776c44712080d2537811b2c7389a5af538774ea2408e3f60fafca0c2d81d9dcc"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1013.0/snyk-linux"
    sha256 "c20bc0d5926bab059e5e9b970b511d4f108896f3c4b07e0ca26405cd969c0569"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
