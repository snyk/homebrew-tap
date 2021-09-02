class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.696.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.696.0/snyk-macos"
    sha256 "e06fa5f8d963e8a3e2f9d1bfcf5f66d412ce4d5ad60e24512cfe8a65e7077d88"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.696.0/snyk-linux"
    sha256 "8758150fbc6857388861f7560b434bcfd7f8f8be33c42d40b24cf206ff74db3c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
