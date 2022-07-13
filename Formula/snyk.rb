class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.971.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.971.0/snyk-macos"
    sha256 "86cd01e03fd163c465fea9ffc32d5fe1bcae5b6587ffe892c98d1297079fd991"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.971.0/snyk-linux"
    sha256 "a4ffa56cded52ba7234c95af3ec32c91256b0a8c9a74d4aa4e1e6633aaee8d7c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
