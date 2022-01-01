class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.813.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.813.0/snyk-macos"
    sha256 "30e74cd137efc98a2497759ff29aaa842b3bd749b5f9ebc44097560872ca8df3"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.813.0/snyk-linux"
    sha256 "93fa43f44f020491d960f6536b08aeeb738b7b048f22081c44263ae0e0381eda"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
