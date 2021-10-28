class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.746.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.746.0/snyk-macos"
    sha256 "0f78fb8feaec0e10068ebd5e2de0a0224cba48e0140220d99da95bae15a26e39"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.746.0/snyk-linux"
    sha256 "29f1c92393fcf72a9b6901a9f6aeec9e0dfe24017cd16755f17777d9ac04a3cb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
