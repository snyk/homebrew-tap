class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.931.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.931.0/snyk-macos"
    sha256 "2be8624a57de13b4e1f5ebdd6feb21b4d260e1199c7ebbd63a4f85cb2d880fe8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.931.0/snyk-linux"
    sha256 "d0e92d31a3d963dd147451bb56c3c9343010394c4c435bc3b76b65df8353416a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
