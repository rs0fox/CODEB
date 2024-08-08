import pygame
import sys

pygame.init()

# Screen settings
screen = pygame.display.set_mode((800, 600))
pygame.display.set_caption('Simple Game')

# Colors
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

# Game loop
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    
    screen.fill(WHITE)
    pygame.draw.circle(screen, BLACK, (400, 300), 50)  # Draw a circle
    
    pygame.display.flip()

pygame.quit()
